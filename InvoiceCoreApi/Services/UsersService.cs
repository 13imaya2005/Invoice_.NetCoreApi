using AutoMapper;
using InvoiceCoreApi.DTO;
using InvoiceCoreAPI.Contracts;

using InvoiceCoreAPI.DTO;

using InvoiceCoreAPI.Entities;

using InvoiceCoreAPI.Repositories;

namespace InvoiceCoreAPI.Services

{

    public class UsersService : IUsersService

    {

        private readonly IUsersRepository _repository;

        private readonly IMapper _mapper;

        public UsersService(IUsersRepository repository, IMapper mapper)

        {

            _repository = repository;

            _mapper = mapper;

        }

        public async Task<int> AddAsync(UserDto dto)

        {

            var entity = _mapper.Map<Users>(dto);

            return await _repository.AddAsync(entity);

        }

        public async Task<IEnumerable<UserDto>> GetAllAsync()

        {

            var users = await _repository.GetAllAsync();

            return _mapper.Map<IEnumerable<UserDto>>(users);

        }

        public async Task<UserDto?> GetByIdAsync(int id)

        {

            var users = await _repository.GetByIdAsync(id);

            return users == null ? null : _mapper.Map<UserDto?>(users);

        }

        public async Task<bool> UpdateAsync(UserDto dto)

        {

            var entity = _mapper.Map<Users>(dto);

            return await _repository.UpdateAsync(entity);

        }

        public async Task<bool> DeleteAsync(int id)

        {

            return await _repository.DeleteAsync(id);

        }

        public async Task<PagedResultDto<UserDto>> GetAllPagedAsync(

            string? UserName,

            string? FirstName,

            string? LastName,

            string? PhoneNumber,

            string? City,

            DateTime? DateOfBirth,

            bool? IsActive,

            int PageNumber,

            int Pagesize

            )

        {

            var result = await _repository.GetAllPagedAsync(

                UserName, FirstName, LastName, PhoneNumber, City, DateOfBirth, IsActive, PageNumber, Pagesize);

            return new PagedResultDto<UserDto>

            {

                Data = _mapper.Map<IEnumerable<UserDto>>(result.Data),

                TotalRecords = result.TotalRecords

            };

        }

    }

}