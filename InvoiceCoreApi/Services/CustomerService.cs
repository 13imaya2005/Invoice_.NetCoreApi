using AutoMapper;
using InvoiceCoreApi.DTO;
using InvoiceCoreAPI.Contracts;

using InvoiceCoreAPI.DTO;

using InvoiceCoreAPI.Entities;

using InvoiceCoreAPI.Repositories;

namespace InvoiceCoreAPI.Services

{

    public class CustomerService : ICustomerService

    {

        private readonly ICustomerRepoitory _repository;

        private readonly IMapper _mapper;

        public CustomerService(ICustomerRepoitory repository, IMapper mapper)

        {

            _repository = repository;

            _mapper = mapper;

        }

        public async Task<int> AddAsync(CustomerDto dto)

        {

            var entity = _mapper.Map<Customer>(dto);

            return await _repository.AddAsync(entity);

        }

        public async Task<IEnumerable<CustomerDto>> GetAllAsync()

        {

            var items = await _repository.GetAllAsync();

            return _mapper.Map<IEnumerable<CustomerDto>>(items);

        }

        public async Task<CustomerDto?> GetByIdAsync(int id)

        {

            var item = await _repository.GetByIdAsync(id);

            return item == null ? null : _mapper.Map<CustomerDto>(item);

        }

        public async Task<bool> UpdateAsync(CustomerDto dto)

        {

            var entity = _mapper.Map<Customer>(dto);

            return await _repository.UpdateAsync(entity);

        }

        public async Task<bool> DeleteAsync(int id)

        {

            return await _repository.DeleteAsync(id);

        }

        public async Task<PagedResultDto<CustomerDto>> GetAllPagedAsync(

string? customerCode,

string? customerName,

bool?isActive,

int pageNumber,

int pageSize)

        {

            var result = await _repository.GetAllPagedAsync(

                customerCode, customerName, isActive, pageNumber, pageSize);

            return new PagedResultDto<CustomerDto>

            {

                Data = _mapper.Map<IEnumerable<CustomerDto>>(result.Data),

                TotalRecords = result.TotalRecords

            };

        }

    }

}
