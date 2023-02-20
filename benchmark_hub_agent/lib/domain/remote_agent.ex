defmodule RemoteAgent do
  use GenServer

  def start_link(args) do
    GenServer.start_link(RemoteAgent, args, name: RemoteAgent)
  end

  @impl true
  def init(_args) do
    {:ok, :name}
  end

  @impl true
  def handle_call({:run_cmd, cmd}, _from, state) do
    output = Commands.run(cmd, [])
    {:reply, output, state}
  end

  @impl true
  def handle_call({:start_stack, stack, env}, _from, state) do
    output = Containers.start_stack(stack, env)
    {:reply, output, state}
  end

  @impl true
  def handle_call(:restart_stack, _from, state) do
    output = Containers.restart_stack()
    {:reply, output, state}
  end

  @impl true
  def handle_call({:git_clone, url, branch}, _from, state) do
    output = Git.clone(url, branch)
    {:reply, output, state}
  end

  @impl true
  def handle_call({:start_test, scenario, image}, {from, _}, state) do
    output = TestExecutor.start_test(scenario, image, replier(from))
    {:reply, output, state}
  end

  @impl true
  def handle_info({_ref, _result}, state) do
    {:noreply, state}
  end

  @impl true
  def handle_info({:DOWN, _, _, _, :normal}, state) do
    {:noreply, state}
  end

  defp replier(from), do: &notify(from, &1)

  defp notify(from, notification), do: send(from, notification)
end
