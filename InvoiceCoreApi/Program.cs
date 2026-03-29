using InvoiceAPI.Services;
using InvoiceCoreAPI.Repositories;
using InvoiceCoreAPI.Contracts;
using InvoiceCoreAPI.Data;
using InvoiceCoreAPI.Mapper;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.Routing;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseSqlServer(
        builder.Configuration.GetConnectionString("DefaultConnection")
    ));

builder.Services.AddScoped<IItemmasterRepository, ItemmasterRepository>();
builder.Services.AddScoped<IItemMasterService, ItemMasterService>();
builder.Services.AddAutoMapper(typeof(ItemMasterProfile));

// Add services to the container.
var AllowReact = "_allowReact";
builder.Services.AddCors(options =>
{
    options.AddPolicy(name: AllowReact,
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
builder.Services.AddSwaggerGen();

var app = builder.Build();


// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.UseCors(AllowReact);

app.UseAuthorization();

app.MapControllers();

app.Run();
