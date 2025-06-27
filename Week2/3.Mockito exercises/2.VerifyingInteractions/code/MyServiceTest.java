package com.example;

import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import static org.mockito.Mockito.*;

public class MyServiceTest {

    @Test
    public void testVerifyInteraction() {
        // Step 1: Create mock object
        ExternalApi mockApi = Mockito.mock(ExternalApi.class);

        // Step 2: Stub method (optional here, but good practice)
        when(mockApi.getData()).thenReturn("Mock Data");

        // Step 3: Call the method
        MyService service = new MyService(mockApi);
        service.fetchData();

        // Step 4: Verify interaction
        verify(mockApi).getData();
    }
}
