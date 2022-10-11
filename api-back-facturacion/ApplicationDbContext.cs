using api_back_facturacion.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace api_back_facturacion { 
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options): base(options) { 

        }
        public DbSet<Tabla_Cliente> Tabla_Cliente { get; set; }
     
        public DbSet<Tabla_Producto> Tabla_Producto { get; set; }       

        public DbSet<Tabla_Inventario> Tabla_Inventario { get; set; }
       
        public DbSet<Tabla_Facturacion> Tabla_Facturacion { get; set; }

        public DbSet<ViewListaProductos> vw_lista_precios_productos { get; set; }

        public DbSet<ViewProductosExistenciaMin> vw_lista_producto_existencia_min { get; set; }

        public DbSet<ViewClienteNoMayor> vw_lista_cliente_no_mayor_35 { get; set; }

        public DbSet<ViewVentaPorProductoAno> vw_lista_total_venta_x_producto_x_ano { get; set; }

        public DbSet<ViewPromedioCompra> vw_lista_promedio_compra_x_cliente { get; set; }

        public DbSet<Tabla_Inventario> InventarioRepositorio { get; set; }

        public DbSet<Tabla_Cliente> ClienteRepositorio { get; set; }
        public DbSet<Tabla_Facturacion> FacturacionRepositorio { get; set; }

        public DbSet<Tabla_Producto> ProductoRepositorio { get; set; }

    }
}
