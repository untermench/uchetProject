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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace uchetProject
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void regHyperlink_Click(object sender, RoutedEventArgs e)
        {

        }

        private void _signInButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var user = DB.Connect.con.Сотрудник.FirstOrDefault(i => i.Логин == _logBox.Text.Trim() && i.Пароль == _pasPobx.Password.Trim() || i.Почта == _logBox.Text.Trim() && i.Пароль == _pasPobx.Password.Trim());
                if (user != null)
                {

                }
                else
                {
                    MessageBox.Show("Неверные данные");
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show("Ошибка", ex.Message);
            }
        }
    }
}
