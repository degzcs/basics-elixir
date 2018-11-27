defmodule KV.RegistryTest do
  use ExUnit.Case, async: true

  setup do
    registy = start_supervised!(KV.Registry)
    %{registy: registy}
  end

  test "spawn buckets", %{registy: registy} do
    assert KV.Registry.lookup(registy, "shopping") == :error

    KV.Registry.create(registy, "shopping")
    assert {:ok, bucket} = KV.Registry.lookup(registy, "shopping")

    KV.Bucket.put(bucket, "milk", 1)
    assert KV.Bucket.get(bucket, "milk") == 1
  end
end
