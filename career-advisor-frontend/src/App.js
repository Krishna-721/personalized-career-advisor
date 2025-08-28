// src/App.jsx
import { ChakraProvider, Box, Heading, Text, VStack, Button } from "@chakra-ui/react";
import { useState } from "react";

function App() {
  const [advice, setAdvice] = useState(null);

  const fetchAdvice = async () => {
    const res = await fetch("http://127.0.0.1:5000/users/1/career-advice");
    const data = await res.json();
    setAdvice(data);
  };

  return (
    <ChakraProvider>
      <Box p={6} bg="gray.50" minH="100vh">
        <VStack spacing={6} align="stretch">
          {/* Header */}
          <Box bg="blue.500" p={4} borderRadius="lg" color="white">
            <Heading size="lg">Career Advisor</Heading>
            <Text>Your personalized career & skills guidance</Text>
          </Box>

          {/* Career Advice */}
          <Box bg="white" shadow="md" p={4} borderRadius="md">
            <Heading size="md">Career Advice</Heading>
            {advice ? (
              <>
                <Text>🔹 {advice.advice}</Text>
              </>
            ) : (
              <Text>Click the button to get your advice</Text>
            )}
          </Box>

          <Button colorScheme="blue" onClick={fetchAdvice}>
            Get Career Advice
          </Button>
        </VStack>
      </Box>
    </ChakraProvider>
  );
}

export default App;
