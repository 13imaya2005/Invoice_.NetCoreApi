using Microsoft.EntityFrameworkCore;
using InvoiceCoreAPI.Entities;
namespace InvoiceCoreAPI.Data;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
    {
    }

    public DbSet<Itemmaster> Itemmasters { get; set; }
    public DbSet<Category> Category { get; set; }
    public DbSet<Users> Users { get; set; }
    public DbSet<Customer> Customer { get; set; }
    public DbSet<Vendor> Vendor { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
    }
}