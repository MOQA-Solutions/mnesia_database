defmodule MnesiaDatabase do

  alias MnesiaDatabase.Requests

  def safe_read(table, key), do: 
    Requests.immediate_query(:read, table, key)

  def safe_index_read(table, key, index), do: 
    Requests.immediate_query(:index_read, table, key, index)

  def select(table, match_spec), do: 
    Requests.immediate_query(:select, table, match_spec)

  def safe_write(record), do:
    Requests.immediate_query(:write, record)

  def safe_delete(table, key), do: 
    Requests.immediate_query(:delete, table, key)

  def safe_delete_record(record), do: 
    Requests.immediate_query(:delete_record, record)

  def all_keys(table), do: 
    Requests.immediate_query(:all_keys, table)

  def first_key(table), do: 
    Requests.immediate_query(:first_key, table)

  def next_key(table, key), do:  
    Requests.immediate_query(:next_key, table, key)

  def create_database() do
    init_tables() 
    :ok
  end 

  def start() do 
    :mnesia.stop() 
    :mnesia.start() 
    :mnesia_rocksdb.register() 
    :ok
  end

  def clear_messages_table(), do: 
    :mnesia.clear_table(:message)

#############################################################################################

  defp init_tables() do 
    {:atomic, :ok} = init_messages_table() 
  end 

  defp init_messages_table(), do:   
    :mnesia.create_table(
                          :message, 
                          [
                            {:attributes, 
                              [:id, :from, :to, :cc, :subject, :date, :body]
                            }, 

                            {:rocksdb_copies, [node()]} 
                          ] 
                        ) 

end
