﻿using System;
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
    public partial class FrmMantEstudiante : Form
    {
        public bool Update = false;
        E_Estudiante entities = new E_Estudiante();
        N_Estudiante business = new N_Estudiante();

        public FrmMantEstudiante()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            Close();
        }
        private void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Update == false)
            {
                try
                {
                    entities.Nombres = textNombres.Text;
                 //   entities.IdEstudiante = Convert.ToInt32(textCodigo.Text);
                    entities.Apellidos = textApellidos.Text;
                    entities.Escuela = textEscuela.Text;
                   

                    business.CreatingProducts(entities);
                    FrmSuccess.confirmacionForm("PRODUCTO GUARDADO");
                    Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("No se pudo guardar la categoria" + ex);
                }
            }
            if (Update == true)
            {
                try
                {
                    entities.IdEstudiante = Convert.ToInt32(textId.Text);
                    entities.Nombres = textNombres.Text;
                   // entities.IdEstudiante = Convert.ToInt32(textCodigo.Text);
                    entities.Apellidos = textApellidos.Text;
                    entities.Escuela = textEscuela.Text;

                    business.UpdatingProducts(entities);

                    //     successView.confirmForm("PRODUCTO EDITADO");
                    FrmSuccess.confirmacionForm("PRODUCTO EDITADO");
                    Close();

                    Update = false;
                }
                catch (Exception ex)
                {
                    MessageBox.Show("No se pudo editar la categoria" + ex);
                }
            }
        }
    }
}
