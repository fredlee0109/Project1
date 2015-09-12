func nextCellStates(currentStates: [[Bool]]) -> [[Bool]] {
    // IMPLEMENT ME
    // Take a look at https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life for the rules
    func isValid(row: Int, col: Int) -> Bool {
        return (row >= 0 && row < currentStates.count && col >= 0 && col < currentStates[0].count)
    }
    var nextState: [[Bool]] = currentStates
    for i in 0..<nextState.count {
        for j in 0..<nextState[0].count {
            var liveCellCount: Int = 0
            for k in (i - 1)...(i + 1) {
                for l in (j - 1)...(j + 1) {
                    if (isValid(k, col: l) && !(k == i && l == j)) {
                        if (currentStates[k][l] == true) {
                            liveCellCount++
                        }
                    }
                }
            }
            if (liveCellCount < 2) {
                nextState[i][j] = false;
            } else if (liveCellCount == 2 && liveCellCount == 3 && currentStates[i][j]) {
                continue
            } else if (liveCellCount > 3) {
                nextState[i][j] = false;
            } else if (liveCellCount == 3 && !currentStates[i][j]) {
                nextState[i][j] = true;
            }
        }
    }
    return nextState
}

class LRUCache<K:Hashable, V> {
    private var capacity: Int
    private var count = 0
    private var cache = [K:V]()
    private var LRUDic = [Int:K]()
    private var temp = 1

    init(capacity: Int) {
        self.capacity = capacity
    }

    func get(k: K) -> V? {
        // IMPLEMENT ME

        /*
        *  Get the value of the key if the key exists in the cache, otherwise return nil.
        */
        if (self.cache[k] != nil) {
            return cache[k]
        }
        return nil
    }

    func set(k: K, v: V) {
        // IMPLEMENT ME

        /*
        * Set or insert the value if the key is not already present. 
        * When the cache reached its capacity, it should invalidate the 
        * least recently used item before inserting a new item.
        */
        if (count >= capacity) {
            cache.removeValueForKey(LRUDic[1]!)
            count--
        }
        if (self.cache[k] == nil) {
            self.cache[k] = v
            LRUDic[temp] = k
            count++
            temp++
        }
    }
}
