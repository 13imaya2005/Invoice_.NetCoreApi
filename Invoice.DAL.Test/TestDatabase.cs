
namespace Invoice.DAL.Test;

public static class TestDatabase
{

    public static string ConnectionString =>

        Environment.GetEnvironmentVariable("TEST_DB_CONNECTION")

        ?? "Server=Z14-55M\\SQLEXPRESS,1435;"+

           "Database=Invoice_Test;" +

           "User Id=sa;" +

           "Password=123456;" +

           "Encrypt=False;" +

           "TrustServerCertificate=True";

}
