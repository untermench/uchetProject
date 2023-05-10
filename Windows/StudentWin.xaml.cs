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
using uchetProject.DB;

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
            DB.uchotDBEntities NDB = new DB.uchotDBEntities();
            int removeID = (listDB.SelectedItem as Студент).ID;
            var removeStud = NDB.Студент.FirstOrDefault(i => i.ID == removeID);
            if (removeStud != null)
            {
                conClass.studID = removeStud.ID;
                EditStudWin win = new EditStudWin();
                win.ShowDialog();
            }
            else
            {
                MessageBox.Show("Студент не найден");
            }
        }

        private void removeButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (MessageBox.Show($"Вы действительно хотите удалить запись?",
                        "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                {
                    DB.uchotDBEntities NDB = new DB.uchotDBEntities();
                    int removeID = (listDB.SelectedItem as Студент).ID;
                    var removeStud = NDB.Студент.FirstOrDefault(i => i.ID == removeID);
                    NDB.Студент.Remove(removeStud);
                    NDB.SaveChanges();
                    MessageBox.Show("Данные удалены");

                    listDB.ItemsSource = DB.Connect.con.Студент.ToList();
                }
                else
                {
                    MessageBox.Show("Ошибка");
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show("Ошибка", ex.Message);
            }
        }
    }
}
