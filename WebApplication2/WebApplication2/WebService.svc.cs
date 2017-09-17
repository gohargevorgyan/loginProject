using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.ServiceModel.Web;
using System.Text;
using System.Data.SqlClient;


namespace WebApplication2
{

   
    [ServiceContract(Namespace = "WebApplication2")]
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
   
        // To use HTTP GET, add [WebGet] attribute. (Default ResponseFormat is WebMessageFormat.Json)
        // To create an operation that returns XML,
        //     add [WebGet(ResponseFormat=WebMessageFormat.Xml)],
        //     and include the following line in the operation body:
        //         WebOperationContext.Current.OutgoingResponse.ContentType = "text/xml";
     

    public class WebService {

        [OperationContract]

        public string  DoRegister(String Username, String Password )
        {
            string msg;
            SqlConnection conn = new SqlConnection(); 
            conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename='C:\\Users\\Vardan\\gohar-repos\\asp\\WebApplication2\\WebApplication2\\App_Data\\TestDatabase.mdf';Integrated Security=True" ;
           
            SqlCommand cmd = new SqlCommand("insert into TestTable(Username,Password,Name,Adress) values(@UserName,@Password,@Name,@Adress)", conn);
            cmd.Parameters.AddWithValue("@UserName", Username);
            cmd.Parameters.AddWithValue("@Password", Password);
            cmd.Parameters.AddWithValue("@Name", "");
            cmd.Parameters.AddWithValue("@Adress", "");
            conn.Open();
 
            int result = cmd.ExecuteNonQuery();
            if (result == 1)
            {
                msg = "Success!";
            }
            else
            {
                msg = "Failre!";
            }

            conn.Close();
            return msg;
        }
       
        [OperationContract]
        public string DoLogin(String Username, String Password)
        {
           string msg1 ;

            SqlConnection conn = new SqlConnection(); 
            conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename='C:\\Users\\Vardan\\gohar-repos\\asp\\WebApplication2\\WebApplication2\\App_Data\\TestDatabase.mdf';Integrated Security=True" ;
            conn.Open();
            SqlCommand com = new SqlCommand("Select * from TestTable where Username='" + Username + "';", conn);
            
 
            using (SqlDataReader reader = com.ExecuteReader())
            {
                if (reader.Read())
                {
                  if(Password.Equals(reader["Password"].ToString()))
           
                   {
                       msg1 = "ok";
                    }
                  else
                  {
                      msg1 = "wrong";
                  }

                }

                else {
                    msg1 = "Database can't find ! ";

                }
              }
            conn.Close();
            return (msg1);
            
        }


         [OperationContract]
        public string DoSave(String Username ,String Name, String Address) {
            string msg1;

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = "Data Source=(LocalDB)\\v11.0;AttachDbFilename='C:\\Users\\Vardan\\gohar-repos\\asp\\WebApplication2\\WebApplication2\\App_Data\\TestDatabase.mdf';Integrated Security=True";
            conn.Open();
            SqlCommand com = new SqlCommand("UPDATE  TestTable  SET Name ='" +Name+"', Adress='"+Address+"' where Username='"+ Username+"'", conn);
             
             int result = com.ExecuteNonQuery();
            if (result == 1)
            {
                msg1 = "Success!";
            }
            else
            {
                msg1 = "Failre!";
            }

           
            conn.Close();
            return (msg1);
        }
        // Add more operations here and mark them with [OperationContract]
    }
}

