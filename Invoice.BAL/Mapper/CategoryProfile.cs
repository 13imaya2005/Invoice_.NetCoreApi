

using AutoMapper;
using Invoice.Data.Entities;
using Invoice.DTOs;

namespace Invoice.BAL.Mapper;

public class CategoryProfile : Profile
{
    public CategoryProfile()
    {
        CreateMap<CategoryEntity, CategoryDto>().ReverseMap();
    }
}
