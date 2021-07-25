using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using CapaDatos;
using System.Data;
namespace CapaNegocio
{
    public class N_Estudiante
    {
        D_Estudiante data = new D_Estudiante();
        E_Estudiante entities = new E_Estudiante();

        public DataTable ListingProducts()
        {
            return data.ListProducts();
        }
        public DataTable SearchingProducts(string search)
        {
            entities.Search = search;
            return data.SearchProducts(entities);
        }

        public void CreatingProducts(E_Estudiante product)
        {
            data.CreateProduct(product);
        }

        public void UpdatingProducts(E_Estudiante product)
        {
            data.UpdateProduct(product);
        }

        public void DeletingProducts(int id)
        {
            data.DeleteProduct(id);
        }
    }
}
