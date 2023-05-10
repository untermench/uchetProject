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

namespace uchetProject.Windows
{
    /// <summary>
    /// Логика взаимодействия для StudentWin.xaml
    /// </summary>
    public partial class StudentWin : Window
    {
        public StudentWin()
        {
            InitializeComponent();
            listDB.ItemsSource = DB.Connect.con.Студент.ToList();
        }

        private void listDB_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {

        }

        private void removeButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                DB.uchotDBEntities co = new DB.uchotDBEntities();
                var remove = co.Студент.FirstOrDefault(i => i.ID == (listDB.SelectedItem as DB.Студент).ID);
                co.Студент.Remove(remove);
                co.SaveChanges();

            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка" + ex.Message);
            }
        }
    }
}
