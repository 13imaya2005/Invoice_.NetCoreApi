using AutoMapper;
using Invoice.Data.Entities;
using Invoice.DTOs;


namespace Invoice.BAL.Mapper;

public class ItemMasterProfile : Profile
{
    public ItemMasterProfile()
    {
        CreateMap< ItemmasterEntity, ItemMasterDto>().ReverseMap();
    }
}
