using api_back_facturacion;
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
    public class InventarioRepositorio : IInventarioRepositorio
    {
        private readonly ApplicationDbContext _dbCont;
        private IMapper _mapper;

        public InventarioRepositorio(ApplicationDbContext db, IMapper mapper)
        {
            _dbCont = db;
            _mapper = mapper;
        }
        public async Task<InventarioDto> CreateUpdate(InventarioDto inventarioDto)
        {
            Tabla_Inventario inventario = _mapper.Map<InventarioDto, Tabla_Inventario>(inventarioDto);
            if (inventario.id > 0)
            {
                _dbCont.Tabla_Inventario.Update(inventario);
            }
            else
            {
                await _dbCont.Tabla_Inventario.AddAsync(inventario);
            }

            await _dbCont.SaveChangesAsync();
            return _mapper.Map<Tabla_Inventario, InventarioDto>(inventario);
        }

        public async Task<bool> DeleteInventario(Int64 id)
        {
            try
            {
                Tabla_Inventario inventario = await _dbCont.Tabla_Inventario.FindAsync(id);
                if (inventario == null)
                {
                    return false;
                }
                _dbCont.Tabla_Inventario.Remove(inventario);
                await _dbCont.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {
                return false;
            }            
        }

        public async Task<List<InventarioDto>> GetInventario()
        {
            List<Tabla_Inventario> inventario = await _dbCont.Tabla_Inventario.ToListAsync();
            return _mapper.Map<List<InventarioDto>>(inventario);
        }

        public async Task<InventarioDto> GetInventarioById(Int64 id)
        {
            Tabla_Inventario inventario = await _dbCont.Tabla_Inventario.FindAsync(id);
            return _mapper.Map<InventarioDto>(inventario);
        }
    }
}
