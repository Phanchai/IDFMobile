using System;
using System.Security.Cryptography;
using System.Text;

namespace ProjectIDFMobile.Class
{
	public class Cryptigraphy
	{
		public Cryptigraphy()
		{
		}

        public void SaveToken(string token)
        {
            var path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Personal), "token.txt");
            var encryptedToken = EncryptString(token, "MySuperSecretEncryptionKey123456");
            File.WriteAllText(path, encryptedToken);
        }

        public string? LoadToken()
        {
            var path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Personal), "token.txt");
            if (File.Exists(path))
            {
                var encryptedToken = File.ReadAllText(path);
                return DecryptString(encryptedToken, "MySuperSecretEncryptionKey123456");
            }
            return null;
        }

        private string EncryptString(string plainText, string key)
        {
            byte[] keyBytes = Encoding.UTF8.GetBytes(key);
            using (var aes = Aes.Create())
            {
                aes.Key = keyBytes;
                aes.GenerateIV();
                byte[] iv = aes.IV;
                using (var encryptor = aes.CreateEncryptor(aes.Key, iv))
                using (var ms = new MemoryStream())
                {
                    ms.Write(iv, 0, iv.Length);
                    using (var cs = new CryptoStream(ms, encryptor, CryptoStreamMode.Write))
                    using (var sw = new StreamWriter(cs))
                    {
                        sw.Write(plainText);
                    }
                    return Convert.ToBase64String(ms.ToArray());
                }
            }
        }

        private string DecryptString(string encryptedText, string key)
        {
            byte[] fullCipher = Convert.FromBase64String(encryptedText);
            byte[] iv = new byte[16];
            byte[] cipher = new byte[fullCipher.Length - iv.Length];

            Array.Copy(fullCipher, iv, iv.Length);
            Array.Copy(fullCipher, iv.Length, cipher, 0, cipher.Length);

            byte[] keyBytes = Encoding.UTF8.GetBytes(key);
            using (var aes = Aes.Create())
            {
                aes.Key = keyBytes;
                aes.IV = iv;
                using (var decryptor = aes.CreateDecryptor(aes.Key, aes.IV))
                using (var ms = new MemoryStream(cipher))
                using (var cs = new CryptoStream(ms, decryptor, CryptoStreamMode.Read))
                using (var sr = new StreamReader(cs))
                {
                    return sr.ReadToEnd();
                }
            }
        }
    }
}

