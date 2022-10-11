using api_back_facturacion.Models;
using api_back_facturacion.Models.Dto;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace api_back_facturacion.Repositorio
{
    public class ClienteRepositorio : IClienteRepositorio
    {
        private readonly ApplicationDbContext _dbCont;
        private IMapper _mapper;

        public ClienteRepositorio(ApplicationDbContext db,  IMapper mapper) {
            _dbCont = db;
            _mapper = mapper;
        }

        public async Task<ClienteDto> CreateUpdate(ClienteDto clienteDto)
        {
            Tabla_Cliente cliente = _mapper.Map<ClienteDto, Tabla_Cliente>(clienteDto);
            if (cliente.id > 0)
            {
                _dbCont.Tabla_Cliente.Update(cliente);
            }
            else
            {
                await _dbCont.Tabla_Cliente.AddAsync(cliente);
            }

            await _dbCont.SaveChangesAsync();
            return _mapper.Map<Tabla_Cliente, ClienteDto>(cliente);
        }

        public async Task<bool> DeleteCliente(Int64 id)
        {
            try
            {
                Tabla_Cliente cliente = await _dbCont.Tabla_Cliente.FindAsync(id);
                if (cliente == null)
                {
                    return false;
                }

                _dbCont.Tabla_Cliente.Remove(cliente);
                await _dbCont.SaveChangesAsync();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }

        public async Task<List<ClienteDto>> GetCliente()
        {
            List<Tabla_Cliente> cliente = await _dbCont.Tabla_Cliente.ToListAsync();
            return _mapper.Map<List<ClienteDto>>(cliente);

        }

        public async Task<ClienteDto> GetClienteById(Int64 id)
        {
            Tabla_Cliente cliente = await _dbCont.Tabla_Cliente.FindAsync(id);
            return _mapper.Map<ClienteDto>(cliente);
        }

    }
}
