defmodule MnesiaDatabase.Query do 
 
  def read_data(table, key), do: 
           :mnesia.activity(:async_dirty, &(:mnesia.read/1), [{table, key}], :mnesia_frag)

  def index_read_data(table, key, index), do:
           :mnesia.activity(:async_dirty, &(:mnesia.index_read/3), [table, key, index], :mnesia_frag)

  def select(table, match_spec), do:
           :mnesia.activity(:async_dirty, &(:mnesia.select/2), [table, match_spec], :mnesia_frag)        

  def write_data(record), do: 
           :mnesia.activity(:async_dirty, &(:mnesia.write/1), [record], :mnesia_frag)

  def delete_data(table, key), do:
           :mnesia.activity(:async_dirty, &(:mnesia.delete/1), [{table, key}], :mnesia_frag)  

  def delete_record(record), do: 
           :mnesia.activity(:async_dirty, &(:mnesia.delete_object/1), [record], :mnesia_frag)

  def all_keys(table), do:
           :mnesia.activity(:async_dirty, &(:mnesia.all_keys/1), [table], :mnesia_frag)

  def first_key(table), do:
           :mnesia.activity(:async_dirty, &(:mnesia.first/1), [table], :mnesia_frag)

  def next_key(table, key), do:
           :mnesia.activity(:async_dirty, &(:mnesia.next/2), [table, key], :mnesia_frag)

  def transaction(fun, args), do: 
           :mnesia.activity(:transaction, fun, args, :mnesia_frag)

end 

