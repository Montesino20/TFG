
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplicador_tb is
end multiplicador_tb;

architecture Behavioral of multiplicador_tb is
component multiplicador is
    Port ( mult_x : in SIGNED (7 downto 0);
           mult_y : in SIGNED (7 downto 0);
           producto : out SIGNED (15 downto 0));
end component;

signal mult_x, mult_y: signed (7 downto 0);
signal producto : signed (15 downto 0);

constant DELTA : time := 100 ns;
begin

DUT : multiplicador
        port map(
            mult_x => mult_x,
            mult_y => mult_y,
            producto => producto);
            


process
begin
        mult_x <= "00000000";--0
        mult_y <= "00000000";--0
       

        wait for DELTA;
        
        mult_x <= "00000001";--1
        mult_y <= "00000010";--2
        
        
         wait for DELTA ;
        mult_x <= "00010000";--16
        mult_y <= "00000010";--2
        
wait;
end process;
end Behavioral;