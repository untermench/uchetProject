using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
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
using System.Windows.Threading;

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
            timer.Tick += new EventHandler(_Tick);
        }

        private void regHyperlink_Click(object sender, RoutedEventArgs e)
        {
            Windows.passwordWin win = new Windows.passwordWin();
            win.ShowDialog();
        }

        int count = 0;
        DispatcherTimer timer = new DispatcherTimer() { Interval = new TimeSpan(0, 0, 10)};

        private void _signInButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var user = DB.Connect.con.Сотрудник.FirstOrDefault(i => i.Логин == _logBox.Text.Trim() && i.Пароль == _pasPobx.Password.Trim() || i.Почта == _logBox.Text.Trim() && i.Пароль == _pasPobx.Password.Trim());
                if (user != null)
                {
                    if (user.ID_Тип == 1)
                    {
                        Windows.FrameWin win = new Windows.FrameWin();
                        win.Show();
                        Close();
                    }
                    else
                    {
                        Close();
                    }
                }
                else
                {
                    MessageBox.Show("Неверные данные");
                    count++;
                    if(count == 5)
                    {
                        _signInButton.IsEnabled = false;
                        timer.Start();
                        MessageBox.Show("Превышен лимит ошибочных входов");
                    }
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show("Ошибка", ex.Message);
            }
        }
        private void _Tick(object sender, EventArgs e)
        {
            timer.Stop();
            _signInButton.IsEnabled = true;
            count = 0;
        }
    }
}
