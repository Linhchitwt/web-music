using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Web_Music.Models;

namespace Web_Music.Function
{
    public class BaiHatF
    {
        MyDBConect db = new MyDBConect();
        public int stt { set; get; }
        public SAN_PHAM SP { set; get; }
        public string TrinhBay { set; get; }
        public string number { set; get; }
        public string Time { set; get; }
        public bool Active { set; get; }
        public BaiHatF()
        {

            this.TrinhBay = "";
            this.Active = false;


        }
        public BaiHatF(int stt,string number,SAN_PHAM SP, string TrinhBay,string Time)
        {
            this.stt = stt;
            this.SP = SP;
            this.TrinhBay = TrinhBay;
            this.number = number;
            this.Time = Time;
            this.Active = false;

        }
        //public void setstt()
        //public int getstt()
        //{
        //    return stt;
        //}
        //public SAN_PHAM getSP()
        //{
        //    return SP;
        //}
        //public string getTrinhBay()
        //{
        //    return TrinhBay;
        //}
    }
}