package com.objectmentor.utilities.args;

import org.junit.Assert;
import org.junit.Test;

public class ArgsTest {
    @Test
    public void testCreateArgs() throws Exception {
        String[] args = new String[]{};
        Args argsParser = new Args("1.p#.d#*", args);
        Assert.assertNotNull(argsParser);
    }
}
