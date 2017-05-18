// C#_API_Client.cs

using System;
using System.Net;

namespace Ipify.Examples {
  class Program {
    public static void Main (string[] args) {
      WebClient webClient = new WebClient();
      string publicIp = webClient.DownloadString("https://api.ipify.org");
      Console.WriteLine("My public IP Address is: {0}", publicIp);
    }
  }
}
