using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaNegocio;
using CapaEntidades;

namespace CapaPresentacion
{
    public partial class FrmEstudiante : Form
    {
        N_Estudiante oEstudiante = new N_Estudiante();
        public FrmEstudiante()
        {
            InitializeComponent();
            MostrarTablaEstudiante();
            OcultarMoverAncharColumnas();
        }
        public void OcultarMoverAncharColumnas()
        {
            TablaEstudiante.Columns[0].DisplayIndex = 6;
            TablaEstudiante.Columns[1].DisplayIndex = 6;

        }
        public void MostrarTablaEstudiante()
        {
            N_Estudiante oEstudiante = new N_Estudiante();
            TablaEstudiante.DataSource = oEstudiante.ListingProducts();
        }
        public void BuscarEstudiante(string search)
        {
            N_Estudiante n_Estudiante = new N_Estudiante();
            TablaEstudiante.DataSource = oEstudiante.SearchingProducts(search);

        }
        public void textBuscar_TextChanged(object sender,EventArgs e)
        {
            BuscarEstudiante(textBuscar.Text);
        }
        private void btnNuevoEstudiante_Click(object sender, EventArgs e)
        {
            FrmMantEstudiante frm = new FrmMantEstudiante();
            frm.ShowDialog();
            frm.Update = false;
            MostrarTablaEstudiante();
          //  ShowTotal();
        }
        private void TablaEstudiante_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (TablaEstudiante.Rows[e.RowIndex].Cells["eliminar"].Selected)
            {
                Form message = new FrmInformation("¿ESTAS SEGURO DE ELIMINAR EL PRODUCTO?");
                DialogResult result = message.ShowDialog();

                if (result == DialogResult.OK)
                {
                    int delete = Convert.ToInt32(TablaEstudiante.Rows[e.RowIndex].Cells[2].Value.ToString());
                    oEstudiante.DeletingProducts(delete);
                    FrmSuccess.confirmacionForm("ELIMINADO");
                    MostrarTablaEstudiante();
                   // ShowTotal();
                }
            }
            else if (TablaEstudiante.Rows[e.RowIndex].Cells["editar"].Selected)
            {
                FrmMantEstudiante frm = new FrmMantEstudiante();
                frm.Update = true;
                frm.textId.Text = TablaEstudiante.Rows[e.RowIndex].Cells["IdEstudiante"].Value.ToString();
                frm.textCodigo.Text = TablaEstudiante.Rows[e.RowIndex].Cells["CodEstudiante"].Value.ToString();
                frm.textNombres.Text = TablaEstudiante.Rows[e.RowIndex].Cells["Nombres"].Value.ToString();
                frm.textApellidos.Text = TablaEstudiante.Rows[e.RowIndex].Cells["Apellidos"].Value.ToString();
                frm.textEscuela.Text = TablaEstudiante.Rows[e.RowIndex].Cells["Escuela"].Value.ToString();
              
                frm.ShowDialog();
                MostrarTablaEstudiante();
                //ShowTotal();
            }
        }
        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
