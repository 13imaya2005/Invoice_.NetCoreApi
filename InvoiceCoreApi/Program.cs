using InvoiceAPI.Services;
using InvoiceCoreAPI.Contracts;
using InvoiceCoreAPI.Data;
using InvoiceCoreAPI.Mapper;
using InvoiceCoreAPI.Repositories;
using InvoiceCoreAPI.Services;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Data;
using Serilog;
using System.Text;
using InvoiceCoreAPI.Middleware;

Log.Logger = new LoggerConfiguration()
    .WriteTo.Console()
    .WriteTo.File(
        "logs/log.txt",
        rollingInterval: RollingInterval.Day)
    .CreateLogger();

var builder = WebApplication.CreateBuilder(args);
builder.Host.UseSerilog();
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseSqlServer(
        builder.Configuration.GetConnectionString("DefaultConnection")
    ));
builder.Services.AddScoped<IDbConnection>(sp =>
{
    var configuration = sp.GetRequiredService<IConfiguration>();

    var connectionString =
        configuration.GetConnectionString("DefaultConnection");

    return new SqlConnection(connectionString);
});
builder.Services.AddScoped<IItemmasterRepository, ItemmasterRepositoryEFSp>();
builder.Services.AddScoped<ICategoryRepository, CategoryRepositories>();
builder.Services.AddScoped<IItemMasterService, ItemMasterServiceEFSp>();
builder.Services.AddScoped<ICategoryService, CategoryService>();
builder.Services.AddAutoMapper(typeof(ItemMasterProfile));
builder.Services.AddAutoMapper(typeof(CategoryProfile));
builder.Services.AddScoped<IUsersRepository, UsersRepositorySpDap>();
builder.Services.AddScoped<IUsersService, UsersServiceSpDap>();
builder.Services.AddAutoMapper(typeof(UsersProfile));
builder.Services.AddScoped<ICustomerRepoitory, CustomerRepositories>();
builder.Services.AddScoped<ICustomerService, CustomerService>();
builder.Services.AddAutoMapper(typeof(CustomerProfile));
builder.Services.AddScoped<IVendorRepository, VendorRepositories>();
builder.Services.AddScoped<IVendorService,VendorService>();
builder.Services.AddAutoMapper(typeof(VendorProfile));

builder.Services.AddApiVersioning(options =>
{
    options.DefaultApiVersion = new ApiVersion(1, 0);
    options.AssumeDefaultVersionWhenUnspecified = true;
    options.ReportApiVersions = true;
});

builder.Services.AddVersionedApiExplorer(options =>
{
    options.GroupNameFormat = "'v'VVV";
    options.SubstituteApiVersionInUrl = true;
});


// Add services to the container.
var AllowAngular = "_allowAngular";
builder.Services.AddCors(options =>
{
    options.AddPolicy(name: AllowAngular,
        policy =>
        {
            policy.WithOrigins("http://localhost:4200")
                  .AllowAnyHeader()
                  .AllowAnyMethod();
        });
});

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
var jwtKey = builder.Configuration["Jwt:Key"] ?? "v2UJQxTrwUCqqJkehkxvSUZKQCX6gNmRWq7q1bWa3Jw=";
var jwtIssuer = builder.Configuration["Jwt:Issuer"] ?? "yourapiissuer";
builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme; ;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
}).AddJwtBearer(options =>
{
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer = true,
        ValidateAudience = false,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        ValidIssuer = jwtIssuer,
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtKey))
    };
});
builder.Services.AddSwaggerGen(c => {
    c.EnableAnnotations();
    c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        In = ParameterLocation.Header,
        Description = "Insert JWT like: Bearer {your token}",
        Name = "Authorization",
        Type = SecuritySchemeType.ApiKey,
        Scheme = "Bearer"
    });
    c.AddSecurityRequirement(new OpenApiSecurityRequirement{
        {
            new OpenApiSecurityScheme{
                Reference = new OpenApiReference{
                    Type = ReferenceType.SecurityScheme,
                    Id = "Bearer"
                }
            },
            Array.Empty<string>()
        }
    });
});


var app = builder.Build();

app.UseMiddleware<ExceptionHandlingMiddleware>();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.UseCors(AllowAngular);

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
