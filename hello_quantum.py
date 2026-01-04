"""
Hello Quantum! - Your First Qiskit Project

This script demonstrates basic quantum computing concepts using Qiskit:
- Creating quantum circuits
- Applying quantum gates
- Creating a Bell state (entanglement)
- Running on a simulator
"""

from qiskit import QuantumCircuit
from qiskit_aer import AerSimulator
from qiskit.visualization import plot_histogram
import matplotlib.pyplot as plt


def create_bell_state():
    """
    Creates a Bell state (maximally entangled state) between two qubits.
    This is one of the most fundamental quantum states.
    """
    # Create a quantum circuit with 2 qubits and 2 classical bits
    qc = QuantumCircuit(2, 2)
    
    # Apply Hadamard gate to the first qubit (creates superposition)
    qc.h(0)
    
    # Apply CNOT gate (creates entanglement)
    qc.cx(0, 1)
    
    # Measure both qubits
    qc.measure([0, 1], [0, 1])
    
    return qc


def create_superposition_demo():
    """
    Demonstrates quantum superposition with a single qubit.
    """
    qc = QuantumCircuit(1, 1)
    
    # Apply Hadamard gate to create superposition
    qc.h(0)
    
    # Measure the qubit
    qc.measure(0, 0)
    
    return qc


def run_circuit(circuit, shots=1024):
    """
    Run a quantum circuit on a simulator.
    
    Args:
        circuit: QuantumCircuit to execute
        shots: Number of times to run the circuit
    
    Returns:
        Result dictionary with measurement counts
    """
    # Use the Aer simulator (local, no API key needed)
    simulator = AerSimulator()
    
    # Execute the circuit
    job = simulator.run(circuit, shots=shots)
    result = job.result()
    
    # Get the counts (measurement results)
    counts = result.get_counts()
    
    return counts


def main():
    print("=" * 60)
    print("Hello Quantum! - Your First Qiskit Project")
    print("=" * 60)
    
    # Example 1: Bell State
    print("\n1. Creating a Bell State (Entangled Qubits)")
    print("-" * 60)
    bell_circuit = create_bell_state()
    print("\nCircuit:")
    print(bell_circuit)
    
    bell_counts = run_circuit(bell_circuit)
    print(f"\nMeasurement results (after {sum(bell_counts.values())} shots):")
    for state, count in bell_counts.items():
        print(f"  |{state}⟩: {count} times ({count/sum(bell_counts.values())*100:.1f}%)")
    
    # Example 2: Superposition
    print("\n\n2. Creating Quantum Superposition")
    print("-" * 60)
    superposition_circuit = create_superposition_demo()
    print("\nCircuit:")
    print(superposition_circuit)
    
    superposition_counts = run_circuit(superposition_circuit)
    print(f"\nMeasurement results (after {sum(superposition_counts.values())} shots):")
    for state, count in superposition_counts.items():
        print(f"  |{state}⟩: {count} times ({count/sum(superposition_counts.values())*100:.1f}%)")
    
    print("\n" + "=" * 60)
    print("Congratulations! You've run your first quantum circuits!")
    print("=" * 60)
    
    # Optional: Visualize results
    try:
        print("\nGenerating visualization...")
        fig = plot_histogram(bell_counts, title="Bell State Measurement Results")
        plt.savefig('bell_state_results.png')
        print("Saved visualization to 'bell_state_results.png'")
    except Exception as e:
        print(f"Could not generate visualization: {e}")


if __name__ == "__main__":
    main()

