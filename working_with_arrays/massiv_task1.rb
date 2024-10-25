#Дан целочисленный массив. Необходимо разместить элементы,
#расположенные до минимального, в конце массива.
def rearrange_array(array)
	min_arr=array.index(array.min)
	result=array[min_arr..-1]+array[0...min_arr]
	puts "Перемещенный массив:  #{result}"
end

#Дан целочисленный массив и интервал a..b. Необходимо найти
#максимальный из элементов в этом интервале.
def find_max(array,a,b)
	if a < 0 || b >= array.size || a > b
		puts "Некорректный интервал."
    return
  end
	max=array[a..b].max
	puts " Максимальный элемент в интервале: #{max}"
end

arr=[5,7,8,3,1,8,6,12]

rearrange_array(arr)
find_max(arr,1,4)