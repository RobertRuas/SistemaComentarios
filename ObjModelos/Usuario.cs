using System;

namespace ObjModelos
{
    class Usuario
    {
        public int IDUsuario { get; set; }

        public string Usuario { get; set; }

        public int IDSexo { get; set; }

        public DateTime DataNascimento { get; set; }

        public string Email { get; set; }

        public string UsuarioNome { get; set; }

        public string UsuarioSenha { get; set; }

        public int IDPrevilegios { get; set; }

        public DateTime DataCadastro { get; set; }

        public int IDStatus { get; set; }
    }
}
