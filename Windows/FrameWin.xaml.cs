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
    /// Логика взаимодействия для FrameWin.xaml
    /// </summary>
    public partial class FrameWin : Window
    {
        public FrameWin()
        {
            InitializeComponent();
            listDB.ItemsSource = DB.Connect.con.Сотрудник.ToList();
        }

        private void editButton_Click(object sender, RoutedEventArgs e)
        {
            
        }
    }
}
