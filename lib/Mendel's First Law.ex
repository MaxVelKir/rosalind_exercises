 defmodule IPRB do

   @homoD 23
   @hete 29
   @homoR 26

   def main(homoD \\ @homoD, hete \\ @hete, homoR \\ @homoR) do

     total = homoD + hete + homoR

     hDhD = (homoD / total) * ((homoD - 1) / (total - 1))
     hDhR = (homoD / total) * (homoR / (total - 1))
     hDhE = (homoD / total) * (hete / (total - 1))
     hEhE = (hete / total) * ((hete - 1) / (total - 1)) * 0.75
     hEhD = (hete / total) * (homoD / (total - 1))
     hEhR = (hete / total) * ((homoR / (total - 1)) * 0.5)
     hRhR = (homoR / total) * ((homoR - 1) / (total - 1)) * 0
     hRhE = (homoR / total) * (hete / (total - 1)) * 0.5
     hRhD = (homoR / total) * (homoD / (total - 1))

    hDhD + hDhR + hDhE + hEhE + hEhD + hEhR + hRhR + hRhE + hRhD
    |> Float.round(5)

   end

 end
