using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.IO;
using Microsoft.Win32;

namespace uchetProject.Windows
{
    /// <summary>
    /// Логика взаимодействия для EditStudWin.xaml
    /// </summary>
    public partial class EditStudWin : Window
    {
        public EditStudWin()
        {
            InitializeComponent();
            var stud = new DB.Студент();
            stud = DB.Connect.con.Студент.FirstOrDefault(i => i.ID == conClass.studID);
            string path = Environment.CurrentDirectory + "//" + stud.Изображение;
            MessageBox.Show(path);
            studImage.Source = new BitmapImage(new Uri(path));
        }

        private void studImage_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            OpenFileDialog fileDialog = new OpenFileDialog();
            fileDialog.Filter = "Image files (*.BMP, *.JPG, *.GIF, *.PNG)|*.bmp;*.jpg;*.gif;*.png*";
            if (fileDialog.ShowDialog() == true)
            {
                string filename = fileDialog.FileName;
                studImage.Source = new BitmapImage(new Uri(filename));

            }
        }
    }
}
