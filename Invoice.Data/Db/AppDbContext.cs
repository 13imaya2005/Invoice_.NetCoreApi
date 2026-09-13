using Invoice.Data.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Invoice.Data.Db
{
    
        public class AppDbContext : DbContext
        {
            public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
            {
            }

            public DbSet<ItemmasterEntity> Itemmasters { get; set; }
            public DbSet<CategoryEntity> Category { get; set; }
            public DbSet<UsersEntity> Users { get; set; }
            public DbSet<Customer> Customer { get; set; }
            public DbSet<VendorEntity> Vendor { get; set; }

            protected override void OnModelCreating(ModelBuilder modelBuilder)
            {
                base.OnModelCreating(modelBuilder);
            }
        }
    }

