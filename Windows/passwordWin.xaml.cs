using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
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

namespace uchetProject.Windows
{
    /// <summary>
    /// Логика взаимодействия для passwordWin.xaml
    /// </summary>
    public partial class passwordWin : Window
    {
        public passwordWin()
        {
            InitializeComponent();
        }

        private void goButton_Click(object sender, RoutedEventArgs e)
        {
            var mail = DB.Connect.con.Сотрудник.FirstOrDefault(i => i.Почта == mailBox.Text);
            if (mail != null)
            {
                // отправитель - устанавливаем адрес и отображаемое в письме имя
                MailAddress from = new MailAddress("k_aguero@list.ru", "Проверка");
                // кому отправляем
                MailAddress to = new MailAddress(mailBox.Text);
                // создаем объект сообщения
                MailMessage m = new MailMessage(from, to);
                // тема письма
                m.Subject = "Тест";
                // текст письма
                m.Body = "<h2>Письмо-тест работы smtp-клиента</h2>";
                // письмо представляет код html
                m.IsBodyHtml = true;
                // адрес smtp-сервера и порт, с которого будем отправлять письмо
                SmtpClient smtp = new SmtpClient("smtp.mail.ru", 2525);
                // логин и пароль
                smtp.Credentials = new NetworkCredential("k_aguero@list.ru", "DFH10VkWEttxTW5QdP5e");
                smtp.EnableSsl = true;
                smtp.Send(m);
                Console.Read();
            MessageBox.Show("Готово");
            }
        }
    }
}
