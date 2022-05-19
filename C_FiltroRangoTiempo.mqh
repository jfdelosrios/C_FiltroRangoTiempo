//+------------------------------------------------------------------+
//|                                          C_FiltroRangoTiempo.mqh |
//|                                  Copyright 2022, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict


struct struct_franjaHoraria
  {
   double               inicio;
   double               fin;
  };


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class C_FiltroRangoTiempo
  {
private:

   struct_franjaHoraria m_franjaHoraria;

public:

                     C_FiltroRangoTiempo();
                    ~C_FiltroRangoTiempo();

   void              Create(struct_franjaHoraria &_franjaHoraria);

   bool              EstaEntreRango();

  };


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_FiltroRangoTiempo::C_FiltroRangoTiempo()
  {
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
C_FiltroRangoTiempo::~C_FiltroRangoTiempo()
  {
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void C_FiltroRangoTiempo::Create(struct_franjaHoraria &_franjaHoraria)
  {
   m_franjaHoraria.inicio = _franjaHoraria.inicio;
   m_franjaHoraria.fin = _franjaHoraria.fin;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool C_FiltroRangoTiempo::EstaEntreRango()
  {

   MqlDateTime dt_struct ;
   TimeCurrent(dt_struct);
   const double _horaActual = dt_struct.hour + dt_struct.min / 60.0;

   if((_horaActual >= m_franjaHoraria.inicio) && (_horaActual < m_franjaHoraria.fin))
      return true;

   return false;

  }
//+------------------------------------------------------------------+
