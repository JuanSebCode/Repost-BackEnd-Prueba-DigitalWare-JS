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
    public class ProductoRepositorio : IProductoRepositorio
    {
        private readonly ApplicationDbContext _dbCont;
        private IMapper _mapper;

        public ProductoRepositorio(ApplicationDbContext db, IMapper mapper)
        {
            _dbCont = db;
            _mapper = mapper;
        }
        public async Task<ProductoDto> CreateUpdate(ProductoDto hotelDto)
        {
            Tabla_Producto producto = _mapper.Map<ProductoDto, Tabla_Producto>(hotelDto);
            if (producto.id > 0)
            {
                _dbCont.Tabla_Producto.Update(producto);
            }
            else
            {
                await _dbCont.Tabla_Producto.AddAsync(producto);
            }

            await _dbCont.SaveChangesAsync();
            return _mapper.Map<Tabla_Producto, ProductoDto>(producto);
        }

        public async Task<bool> DeleteProducto(Int64 id)
        {

            try
            {
                Tabla_Producto producto = await _dbCont.Tabla_Producto.FindAsync(id);
                if (producto == null)
                {
                    return false;
                }

                _dbCont.Tabla_Producto.Remove(producto);
                await _dbCont.SaveChangesAsync();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }



        }

        public async Task<List<ProductoDto>> GetProducto()
        {
            List<Tabla_Producto> producto = await _dbCont.Tabla_Producto.ToListAsync();
            return _mapper.Map<List<ProductoDto>>(producto);
        }

        public async Task<ProductoDto> GetProductoById(Int64 id)
        {
            Tabla_Producto producto = await _dbCont.Tabla_Producto.FindAsync(id);
            return _mapper.Map<ProductoDto>(producto);
        }
    }
}
