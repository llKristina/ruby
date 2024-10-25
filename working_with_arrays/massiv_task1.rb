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

#Дан целочисленный массив. Вывести индексы элементов, которые
#меньше своего левого соседа, и количество таких чисел.
def less_than_neighbor(array)
	index=[]
	count=0
	(1...array.size).each do |i|
		if array[i]<array[i-1]
			index<<i
			count+=1
		end
	end
puts "Индексы элементов меньше левого соседа: #{index}"
puts "Количество таких элементов: #{count}"
end
arr=[5,7,8,3,1,8,6,12]

rearrange_array(arr)
find_max(arr,1,4)
less_than_neighbor(arr)