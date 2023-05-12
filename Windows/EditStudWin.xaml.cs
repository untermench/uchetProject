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
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using uchetProject.DB;

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

            CB_group.ItemsSource = DB.Connect.con.Группы.ToList();
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

        private void CB_group_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var NDB = new uchotDBEntities();
            var selection_gp = CB_group.SelectedItem as Группы;
        }
    }
}
