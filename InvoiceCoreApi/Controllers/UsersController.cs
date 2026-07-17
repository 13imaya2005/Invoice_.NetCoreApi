using Microsoft.AspNetCore.Http;

using Microsoft.AspNetCore.Mvc;

using InvoiceCoreAPI.Contracts;

using InvoiceCoreAPI.DTO;

using InvoiceCoreAPI.Models;

using Microsoft.AspNetCore.Authorization;

using InvoiceCoreAPI.Services;

namespace InvoiceCoreAPI.Controllers

{

    [Route("api/[controller]")]

    [ApiController]

    [Authorize]

    public class UsersController : ControllerBase

    {

        private readonly IUsersService _service;

        public UsersController(IUsersService service)

        {

            _service = service;

        }

        [HttpGet("GetAll")]

        public async Task<IActionResult> GetAll()

        {

            try

            {

                var data = await _service.GetAllAsync();

                return Ok(new ApiResponse<IEnumerable<UserDto>>

                {

                    Success = true,

                    Message = "Users retrieved successfully",

                    Data = data

                });

            }

            catch (Exception ex)

            {

                return StatusCode(500, new ApiResponse<string>

                {

                    Success = false,

                    Message = "Error retrieving Users",

                    Error = new ApiError

                    {

                        Code = "500",

                        Details = ex.Message

                    }

                });

            }

        }

        [HttpGet("GetById/{id}")]

        public async Task<IActionResult> GetById(int id)

        {

            try

            {

                var user = await _service.GetByIdAsync(id);

                if (user == null)

                {

                    return NotFound(new ApiResponse<string>

                    {

                        Success = false,

                        Message = "user not found"

                    });

                }

                return Ok(new ApiResponse<UserDto>

                {

                    Success = true,

                    Message = "User retrieved successfully",

                    Data = user

                });

            }

            catch (Exception ex)

            {

                return StatusCode(500, new ApiResponse<string>

                {

                    Success = false,

                    Message = "Error retrieving user",

                    Error = new ApiError

                    {

                        Code = "500",

                        Details = ex.Message

                    }

                });

            }

        }

        [HttpPost("Create")]

        public async Task<IActionResult> Create(UserDto dto)

        {

            try

            {

                var id = await _service.AddAsync(dto);

                return Ok(new ApiResponse<int>

                {

                    Success = true,

                    Message = "user created successfully",

                    Data = id

                });

            }

            catch (Exception ex)

            {

                return StatusCode(500, new ApiResponse<string>

                {

                    Success = false,

                    Message = "Error creating user",

                    Error = new ApiError

                    {

                        Code = "500",

                        Details = ex.Message

                    }

                });

            }

        }

        [HttpPut("Update/{id}")]

        public async Task<IActionResult> Update(int id, UserDto dto)

        {

            try

            {

                dto.Id = id;

                var updated = await _service.UpdateAsync(dto);

                if (!updated)

                {

                    return NotFound(new ApiResponse<string>

                    {

                        Success = false,

                        Message = "User not found"

                    });

                }

                return Ok(new ApiResponse<string>

                {

                    Success = true,

                    Message = "User Updated successfully"

                });

            }

            catch (Exception ex)

            {

                return StatusCode(500, new ApiResponse<string>

                {

                    Success = false,

                    Message = "Error updating user",

                    Error = new ApiError

                    {

                        Code = "500",

                        Details = ex.Message

                    }

                });

            }

        }

        [HttpDelete("Delete/{id}")]

        public async Task<IActionResult> Delete(int id)

        {

            try

            {

                var deleted = await _service.DeleteAsync(id);

                if (!deleted)

                {

                    return NotFound(new ApiResponse<string>

                    {

                        Success = false,

                        Message = "user not found"

                    });

                }

                return Ok(new ApiResponse<string>

                {

                    Success = true,

                    Message = "user deleted successfully"

                });

            }

            catch (Exception ex)

            {

                return StatusCode(500, new ApiResponse<string>

                {

                    Success = false,

                    Message = "Error deleting user",

                    Error = new ApiError

                    {

                        Code = "500",

                        Details = ex.Message

                    }

                });

            }

        }

        [HttpGet("GetAllPaged")]

        public async Task<IActionResult> GetAllPaged(

            string? UserName,

            string? FirstName,

            string? LastName,

            string? PhoneNumber,

            string? City,

            DateTime? DateOfBirth,

            bool? IsActive,

            int pageNumber = 1,

            int pageSize = 10)

        {

            try

            {

                var result = await _service.GetAllPagedAsync(

                    UserName, FirstName, LastName, PhoneNumber, City, DateOfBirth, IsActive, pageNumber, pageSize);

                return Ok(new ApiResponse<IEnumerable<UserDto>>

                {

                    Success = true,

                    Message = "Users retrieved successfully",

                    Data = result.Data,

                    TotalRecords = result.TotalRecords

                });

            }

            catch (Exception ex)

            {

                return StatusCode(500, new ApiResponse<string>

                {

                    Success = false,

                    Message = "Error retrieving users",

                    Error = new ApiError

                    {

                        Code = "500",

                        Details = ex.Message

                    }

                });

            }

        }

    }

}