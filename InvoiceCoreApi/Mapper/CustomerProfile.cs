using AutoMapper;
using InvoiceCoreAPI.Entities;
using InvoiceCoreAPI.DTO;
namespace InvoiceCoreAPI.Mapper
{
    public class CustomerProfile : Profile
    {
        public CustomerProfile()
        {
            CreateMap<Customer, CustomerDto>().ReverseMap();
        }
    }
}

