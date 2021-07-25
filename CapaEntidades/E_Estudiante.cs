using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class E_Estudiante
    {
        private int _IdEstudiante;
        private string _CodEstudiante;
        private string _Nombres;
        private string _Apellidos;
        private string _Escuela;
        private string search;
        public int IdEstudiante { get => _IdEstudiante; set => _IdEstudiante = value; }
        public string CodEstudiante { get => _CodEstudiante; set => _CodEstudiante = value; }
        public string Nombres { get => _Nombres; set => _Nombres = value; }
        public string Apellidos { get => _Apellidos; set => _Apellidos = value; }
        public string Escuela { get => _Escuela; set => _Escuela = value; }
        public string Search { get => search; set => search = value; }
    }
}
