using AutoMapper;
using InvoiceCoreApi.DTO;
using InvoiceCoreAPI.Contracts;
using InvoiceCoreAPI.DTO;
using InvoiceCoreAPI.Entities;

namespace InvoiceCoreAPI.Services
{
    public class VendorService : IVendorService
    {
        private readonly IVendorRepository _repository;
        private readonly IMapper _mapper;

        public VendorService(IVendorRepository repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }

        public async Task<int> AddAsync(VendorDto dto)
        {
            var entity = _mapper.Map<Vendor>(dto);
            return await _repository.AddAsync(entity);
        }

        public async Task<IEnumerable<VendorDto>> GetAllAsync()
        {
            var items = await _repository.GetAllAsync();
            return _mapper.Map<IEnumerable<VendorDto>>(items);
        }

        public async Task<VendorDto?> GetByIdAsync(int id)
        {
            var item = await _repository.GetByIdAsync(id);
            return item == null ? null : _mapper.Map<VendorDto>(item);
        }

        public async Task<bool> UpdateAsync(VendorDto dto)
        {
            var entity = _mapper.Map<Vendor>(dto);
            return await _repository.UpdateAsync(entity);
        }

        public async Task<bool> DeleteAsync(int id)
        {
            return await _repository.DeleteAsync(id);
        }

        public async Task<PagedResultDto<VendorDto>> GetAllPagedAsync(
            string? VendorCode,
            string? VendorName,
            string? ContactPerson,
            string? MobileNo,
            string? Email,
            string? City,
            bool? IsActive,
            int pageNumber,
            int pageSize)
        {
            var result = await _repository.GetAllPagedAsync(
                VendorCode,
                VendorName,
                ContactPerson,
                MobileNo,
                Email,
                City,
                IsActive,
                pageNumber,
                pageSize);

            return new PagedResultDto<VendorDto>
            {
                Data = _mapper.Map<IEnumerable<VendorDto>>(result.Data),
                TotalRecords = result.TotalRecords
            };
        }
    }
}