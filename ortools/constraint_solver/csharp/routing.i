// Copyright 2010-2017 Google
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// TODO(user): Refactor this file to adhere to the SWIG style guide.
%include "ortools/constraint_solver/csharp/constraint_solver.i"
%include "ortools/constraint_solver/csharp/routing_types.i"
%include "ortools/constraint_solver/csharp/routing_index_manager.i"

// We need to forward-declare the proto here, so that PROTO_INPUT involving it
// works correctly. The order matters very much: this declaration needs to be
// before the %{ #include ".../routing.h" %}.
namespace operations_research {
class RoutingModelParameters;
class RoutingSearchParameters;
}  // namespace operations_research

// Include the file we want to wrap a first time.
%{
#include "ortools/constraint_solver/routing.h"
#include "ortools/constraint_solver/routing_index_manager.h"
#include "ortools/constraint_solver/routing_parameters.h"
#include "ortools/constraint_solver/routing_parameters.pb.h"
#include "ortools/constraint_solver/routing_types.h"
%}

%module(directors="1") operations_research;

%rename (AddDimensionAux) operations_research::RoutingModel::AddDimension;
%rename (AddDimensionWithVehicleCapacityAux) operations_research::RoutingModel::AddDimensionWithVehicleCapacity;
%rename (SetArcCostEvaluatorOfAllVehiclesAux) operations_research::RoutingModel::SetArcCostEvaluatorOfAllVehicles;
%rename (SetArcCostEvaluatorOfVehicleAux) operations_research::RoutingModel::SetArcCostEvaluatorOfVehicle;
%rename (RoutingModelStatus) operations_research::RoutingModel::Status;

%ignore operations_research::RoutingModel::AddVectorDimension(
    const int64* values,
    int64 capacity,
    const std::string& name);

%ignore operations_research::RoutingModel::AddMatrixDimension(
    const int64* const* values,
    int64 capacity,
    const std::string& name);

%ignore operations_research::RoutingModel::RegisterStateDependentTransitCallback;
%ignore operations_research::RoutingModel::StateDependentTransitCallback;
%ignore operations_research::RoutingModel::MakeStateDependentTransit;
%ignore operations_research::RoutingModel::AddDimensionDependentDimensionWithVehicleCapacity;

%extend operations_research::RoutingModel {
  void AddVectorDimension(const std::vector<int64>& values,
                          int64 capacity,
                          bool fix_start_cumul_to_zero,
                          const std::string& name) {
    DCHECK_EQ(values.size(), self->nodes());
    self->AddVectorDimension(values.data(), capacity,
                             fix_start_cumul_to_zero, name);
  }
}

%ignore operations_research::RoutingModel::RoutingModel(
    const RoutingIndexManager&);
%ignore operations_research::RoutingModel::RoutingModel(
    const RoutingIndexManager&, const RoutingModelParameters&);

%rename("%(camelcase)s", %$isfunction) "";

// Protobuf support
PROTO_INPUT(operations_research::RoutingSearchParameters,
            Google.OrTools.ConstraintSolver.RoutingSearchParameters,
            search_parameters)
PROTO_INPUT(operations_research::RoutingModelParameters,
            Google.OrTools.ConstraintSolver.RoutingModelParameters,
            parameters)
PROTO2_RETURN(operations_research::RoutingSearchParameters,
              Google.OrTools.ConstraintSolver.RoutingSearchParameters)
PROTO2_RETURN(operations_research::RoutingModelParameters,
              Google.OrTools.ConstraintSolver.RoutingModelParameters)


%include "ortools/constraint_solver/routing_types.h"
%include "ortools/constraint_solver/routing_parameters.h"
%include "ortools/constraint_solver/routing_index_manager.h"
%include "ortools/constraint_solver/routing.h"
