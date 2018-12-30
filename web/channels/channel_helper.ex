defmodule BABE.ChannelHelper do
  alias BABE.{Repo, ExperimentStatus}
  require Ecto.Query

  def get_experiment_status(experiment_id, variant, chain, realization) do
    status_query =
      Ecto.Query.from(s in ExperimentStatus,
        where: s.experiment_id == ^experiment_id,
        where: s.variant == ^variant,
        where: s.chain == ^chain,
        where: s.realization == ^realization
      )

    Repo.one!(status_query)
  end
end