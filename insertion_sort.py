unsorted = [96, 20, 50, 41, 37, 24, 71, 22, 68, 82]

print unsorted
print 'Sorting...'

def insertion_sort(collection):
    for position, current_value in enumerate(collection):
        while position > 0 and collection[position - 1] > current_value:
            collection[position] = collection[position - 1]
            collection[position - 1] = current_value
            print 'Pass: %d' % position
            print collection

insertion_sort(unsorted)


