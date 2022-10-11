﻿using api_back_facturacion.Models;
using api_back_facturacion.Models.Dto;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace api_back_facturacion.Repositorio
{
    public class ViewPromedioCompraRepositorio : IViewPromedioCompraRepositorio
    {
        private readonly ApplicationDbContext _dbCont;
        private IMapper _mapper;

        public ViewPromedioCompraRepositorio(ApplicationDbContext db, IMapper mapper)
        {
            _dbCont = db;
            _mapper = mapper;
        }
   
        public async Task<List<ViewPromedioCompraDto>> GetViewPromedioCompra()
        {
            List<ViewPromedioCompra> factura = await _dbCont.vw_lista_promedio_compra_x_cliente.ToListAsync();
            return _mapper.Map<List<ViewPromedioCompraDto>>(factura);
        }
       
    }
}
