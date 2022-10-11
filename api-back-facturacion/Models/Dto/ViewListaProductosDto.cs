﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace api_back_facturacion.Models
{
    public class ViewListaProductosDto
    {
        
        public Int64 id { get; set; }

        public String nombre_producto { get; set; }

        //Foreign key for id_inventario
        public Int64 valor_und { get; set; }

        
    }
}
