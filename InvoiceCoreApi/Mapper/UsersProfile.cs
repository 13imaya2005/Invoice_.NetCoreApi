
using AutoMapper;
using InvoiceCoreAPI.Entities;
using InvoiceCoreAPI.DTO;
namespace InvoiceCoreAPI.Mapper
{
    public class UsersProfile : Profile
    {
        public UsersProfile()
        {
            CreateMap<Users, UserDto>().ReverseMap();
        }
    }
}