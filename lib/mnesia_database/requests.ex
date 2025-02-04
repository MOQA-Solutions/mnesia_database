defmodule MnesiaDatabase.Requests do 

  alias MnesiaDatabase.Query

  def immediate_query(:write, record), do:  
    Query.write_data(record)

  def immediate_query(:all_keys, table), do:  
    Query.all_keys(table)

  def immediate_query(:delete_record, record), do:  
    Query.delete_record(record)

  def immediate_query(:read, table, key), do: 
    Query.read_data(table, key)

  def immediate_query(:select, table, match_spec), do: 
    Query.select(table, match_spec)

  def immediate_query(:delete, table, key), do: 
    Query.delete_data(table, key)

  def immediate_query(:transaction, fun, args), do:  
    Query.transaction(fun, args)

  def immediate_query(:index_read, table, key, index), do: 
    Query.index_read_data(table, key, index)
     
end

