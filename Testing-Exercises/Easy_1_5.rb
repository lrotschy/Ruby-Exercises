# Easy_1_5.rb
def rot_13_code(ch)
  case ch
  when 'a'..'m', 'A'..'M' then (ch.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (ch.ord - 13).chr
  end
end

def decipher(string)
  # string.split.map { |word| word.chars.map { |ch| rot_13_code(ch)}.join.to_s}.join(' ').to_s
  new = string.chars.map do |ch|
    if ('a'..'m').include?(ch)
        ch.tr('abcdefghijklm', 'nopqrstuvwxyz')
    elsif('n'..'z').include?(ch)
      ch.tr('nopqrstuvwxyz', 'abcdefghijklm')
    elsif('A'..'M').include?(ch)
        ch.tr('ABCDEFGHIJKLM', 'NOPQRSTUVWXYZ')
    elsif('N'..'Z').include?(ch)
      ch.tr('NOPQRSTUVWXYZ', 'ABCDEFGHIJKLM')
    elsif ch == ' '
      ch
    end
  end
  new.join
end

p decipher 'Nqn Ybirynpr'
p decipher 'Tenpr Ubccre'
p decipher 'Nqryr Tbyqfgvar'
p decipher 'Nyna Ghevat'
p decipher 'Puneyrf Onoontr'
p decipher 'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv'
p decipher 'Wbua Ngnanfbss'
p decipher 'Ybvf Unvog'
p decipher 'Pynhqr Funaaba'
p decipher 'Fgrir Wbof'
p decipher 'Ovyy Tngrf'
p decipher 'Gvz Orearef-Yrr'
p decipher 'Xbaenq Mhfr'
p decipher 'Fve Nagbal Ubner'
p decipher 'Zneiva Zvafxl'
p decipher 'Lhxvuveb Zngfhzbgb'
p decipher 'Unllvz Fybavzfxv'
p decipher 'Tregehqr Oynapu'
